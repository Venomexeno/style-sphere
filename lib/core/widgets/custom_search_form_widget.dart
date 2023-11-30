import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchFormWidget extends StatefulWidget {
  const CustomSearchFormWidget({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  State<CustomSearchFormWidget> createState() => _CustomSearchFormWidgetState();
}

class _CustomSearchFormWidgetState extends State<CustomSearchFormWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'Please Type what you search for...';
          }
          return '';
        },
        keyboardType: TextInputType.text,
        controller: _searchController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xffE5E7EB),
              ),
              borderRadius: BorderRadius.circular(40.r)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(40.r)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(40.r)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xffE5E7EB),
              ),
              borderRadius: BorderRadius.circular(40.r)),
          filled: true,
          fillColor: const Color(0xffE5E7EB),
          hintText: 'Search...',
          hintStyle: TextStyle(
            fontSize: 14.sp,
          ),
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24),
            child: UnconstrainedBox(child: Icon(Icons.search,size: 24.sp,)),
          ),
        ),
      ),
    );
  }
}
