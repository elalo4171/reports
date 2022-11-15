import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reports/app/data/bloc/global_bloc.dart';
import 'package:reports/app/data/model/report_model.dart';
import 'package:reports/app/utils/image_utils.dart';
import 'package:reports/app/widgets/custom_divider.dart';

class NewReport extends StatefulWidget {
  const NewReport({super.key, required this.globalBloc});
  final GlobalBloc globalBloc;

  @override
  State<NewReport> createState() => _NewReportState();
}

class _NewReportState extends State<NewReport> {
  ReportModel _reportModel = const ReportModel();
  bool isKeyboardVisible = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.globalBloc.state.currentReport.title.isNotEmpty) {
        _reportModel = widget.globalBloc.state.currentReport;
        _titleController.text = _reportModel.title;
        _descriptionController.text = _reportModel.description;
        setState(() {});
      }
      var keyboardVisibilityController = KeyboardVisibilityController();
      keyboardVisibilityController.onChange.listen((bool visible) {
        if (mounted) {
          isKeyboardVisible = visible;
          setState(() {});
        }
      });
    });
    super.initState();
  }

  Future<void> takePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      final bytes =
          ImageUtils.convertUint8ListToString(await photo.readAsBytes());
      setState(() {
        _reportModel = _reportModel.copyWith(image: bytes.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<GlobalBloc, GlobalState>(
          bloc: widget.globalBloc,
          builder: (context, state) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                      if (state.isEdit)
                        InkWell(
                          onTap: () async {
                            if (_reportModel.title.isEmpty ||
                                _reportModel.description.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please fill all fields'),
                                ),
                              );
                              return;
                            }
                            widget.globalBloc.add(CreatedReport(_reportModel));
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Save",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      if (!state.isEdit)
                        InkWell(
                          onTap: () async {
                            widget.globalBloc.add(SetIsEdit(true));
                          },
                          child: Text(
                            "Edit",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      if (!state.isEdit)
                        InkWell(
                          onTap: () {
                            widget.globalBloc.add(DeletedReport(_reportModel));
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Delete',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        ),
                      if (state.isEdit)
                        InkWell(
                          onTap: () {
                            takePhoto();
                          },
                          child: Text(
                            'Add',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                        )
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const CustomDivider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    child: TextField(
                      maxLines: 1,
                      controller: _titleController,
                      enabled: state.isEdit,
                      decoration: const InputDecoration(
                        hintText: "The Title",
                      ),
                      onChanged: (value) =>
                          _reportModel = _reportModel.copyWith(
                        title: value,
                      ),
                    ),
                  ),
                ),
                const CustomDivider(),
                const SizedBox(height: 20),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      maxLines: null,
                      autocorrect: true,
                      enabled: state.isEdit,
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        hintText: "Your report",
                      ),
                      onChanged: (value) =>
                          _reportModel = _reportModel.copyWith(
                        description: value,
                      ),
                    ),
                  ),
                ),
                if (_reportModel.image.isNotEmpty && !isKeyboardVisible)
                  SizedBox(
                    width: 100,
                    height: 150,
                    child: Stack(
                      children: [
                        Image.memory(
                          ImageUtils.convertStringToUint8List(
                            _reportModel.image,
                          ),
                        ),
                        if (state.isEdit)
                          Positioned(
                              right: 0,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _reportModel =
                                        _reportModel.copyWith(image: '');
                                  });
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              )),
                      ],
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}
