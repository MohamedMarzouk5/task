import 'package:flutter/material.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/core/widgets/custom_text_form_field.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  num? number1, number2, sum;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool? checkValidatorSum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              labelText: 'number 1',
              validatorNumber: '1',
              onSaved: (numb1) {
                number1 = num.parse(numb1!);
              },
            ),
            CustomTextFormField(
              labelText: 'number 2',
              validatorNumber: '2',
              onSaved: (numb2) {
                number2 = num.parse(numb2!);
              },
            ),
            CustomTextFormField(
              labelText: 'sum',
              validatorNumber: 'sum',
              onSaved: (summation) {
                sum = num.parse(summation!);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CustomBotton(
                    title: 'done',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        if (sum == number1! + number2!) {
                          checkValidatorSum = true;
                          setState(() {});
                        } else {
                          checkValidatorSum = false;
                          setState(() {});
                        }
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                  checkValidatorSum == null
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomBotton(
                                title: 'true',
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              CustomBotton(
                                title: 'false',
                              ),
                            ],
                          ),
                        )
                      : checkValidatorSum == true
                          ? const Row(
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                CustomBotton(
                                  title: 'true',
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                SizedBox(
                                  width: MediaQuery.sizeOf(context).width * .25,
                                ),
                                const CustomBotton(
                                  title: 'false',
                                ),
                              ],
                            )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
