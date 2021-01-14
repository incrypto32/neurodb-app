import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:neurodb/app/dependency_injection/locator.dart';
import 'package:neurodb/app/utilities/flushbar_service.dart';
import 'package:neurodb/models/round/round.dart';

class RoundsFormSheet extends StatefulWidget {
  RoundsFormSheet({Key key, this.submit}) : super(key: key);
  final RoundsData roundData = RoundsData();
  final Function(RoundsData) submit;
  @override
  _RoundsFormSheetState createState() => _RoundsFormSheetState();
}

class _RoundsFormSheetState extends State<RoundsFormSheet> {
  bool loading = false;
  setLoading(bool val) {
    setState(() {
      loading = val;
    });
  }

  submit() async {
    if (!loading) {
      setLoading(true);
      print(widget.roundData.toJson());

      if (widget.roundData.isEmpty) {
        locator<Utils>().showBasicFlushBar(
          context,
          content: "Please fill relevent fields",
          icon: Icon(Icons.error),
        );
      } else {
        try {
          await widget.submit(widget.roundData);
        } catch (e) {
          print(e);
        }
      }

      setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            // padding: EdgeInsets.all(10),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      "Add rounds",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Row(
                    children: [
                      buildTextField(
                        label: "Temp",
                        onChanged: (val) {
                          widget.roundData.temp = val;
                        },
                      ),
                      buildTextField(
                        label: "Pulse",
                        onChanged: (val) {
                          widget.roundData.pulse = val;
                        },
                      ),
                      buildTextField(
                        label: "Sp02",
                        onChanged: (val) {
                          widget.roundData.sp02 = val;
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      buildTextField(
                        label: "Resp Rate",
                        onChanged: (val) {
                          widget.roundData.respRate = val;
                        },
                      ),
                      buildTextField(
                        label: "BP",
                        onChanged: (val) {
                          widget.roundData.bp = val;
                        },
                      ),
                      buildTextField(
                        label: "GRBS",
                        onChanged: (val) {
                          widget.roundData.grbs = val;
                        },
                      ),
                    ],
                  ),

                  RoundsTextField(
                    label: "Investigation",
                    onChanged: (val) {
                      widget.roundData.investigation = val;
                    },
                  ),
                  RoundsTextField(
                    label: "New Complaints",
                    onChanged: (val) {
                      widget.roundData.newComplaints = val;
                    },
                  ),

                  RoundsTextField(
                    label: "New Medication",
                    onChanged: (val) {
                      widget.roundData.medication = val;
                    },
                  ),
                  RoundsTextField(
                    label: "Current Status",
                    onChanged: (val) {
                      widget.roundData.currentStatus = val;
                    },
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Checkbox(
                        value:
                            widget.roundData.procedures.mechanicalThrombectomy,
                        onChanged: (val) {
                          setState(() {
                            widget.roundData.procedures.mechanicalThrombectomy =
                                val;
                          });
                        },
                      ),
                      Text("Mechanical Thrombectomy"),
                      Checkbox(
                        value: widget.roundData.procedures.thrombolysis,
                        onChanged: (val) {
                          setState(() {
                            widget.roundData.procedures.thrombolysis = val;
                          });
                        },
                      ),
                      Text("Thrombolysis"),
                      Checkbox(
                        value: widget.roundData.procedures.conservative,
                        onChanged: (val) {
                          setState(() {
                            widget.roundData.procedures.conservative = val;
                          });
                        },
                      ),
                      Text("Conservative"),
                    ],
                  ),
                  // RoundsTextField(label: "Diagnosis"),
                  // RoundsTextField(label: "Investigation"),
                  // RoundsTextField(label: "New Medication"),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text("Comments :"),
                  ),
                  Container(
                    height: 200,
                    child: RoundsTextField(
                      label: "",
                      isTextArea: true,
                      onChanged: (val) {
                        widget.roundData.comment = val;
                      },
                    ),
                  ),
                  FlatButton(
                    color: Colors.lightBlue[300],
                    onPressed: submit,
                    child: loading
                        ? SpinKitWave(
                            color: Colors.white,
                            size: 12,
                          )
                        : Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Expanded buildTextField({
    String label = "label",
    Function(String) onChanged,
  }) {
    return Expanded(
      child: RoundsTextField(
        label: label,
        onChanged: onChanged,
      ),
    );
  }
}

class RoundsTextField extends StatelessWidget {
  const RoundsTextField({
    Key key,
    this.label,
    this.isTextArea = false,
    this.onChanged,
  }) : super(key: key);

  final String label;
  final bool isTextArea;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextFormField(
        maxLines: isTextArea ? null : 1,
        expands: isTextArea,
        textAlignVertical: TextAlignVertical.top,
        keyboardType: isTextArea ? TextInputType.multiline : TextInputType.text,
        onChanged: onChanged,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.grey[800],
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(8),
          labelText: label,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          errorStyle: TextStyle(color: Colors.pink),
        ),
      ),
    );
  }
}
