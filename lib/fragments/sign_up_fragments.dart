import 'package:flutter/material.dart';
import 'package:laundry_mama_rework/MediaQuery/size.dart';

class SignUpFragments extends StatelessWidget {
  const SignUpFragments({
    super.key,
    required this.layout,
  });

  final AppLayout layout;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: layout.getHeight(80)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SignInForm(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                
              },
              child: Text(
                "All ready have an accouts?",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 16,
                      color: Colors.indigo[700],
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Thank your for choosing us",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "First name",
                      filled: true,
                      enabled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                      ),
                      fillColor: Color.fromARGB(179, 231, 229, 229),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Last name",
                      filled: true,
                      enabled: true,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                      ),
                      fillColor: Color.fromARGB(179, 231, 229, 229),
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                filled: true,
                enabled: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blueGrey,
                  ),
                ),
                fillColor: Color.fromARGB(179, 231, 229, 229),
                border: UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.gps_fixed),
                ),
                hintText: "Address",
                filled: true,
                enabled: true,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blueGrey,
                  ),
                ),
                fillColor: const Color.fromARGB(179, 231, 229, 229),
                border: const UnderlineInputBorder(),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                ),
                filled: true,
                enabled: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blueGrey,
                  ),
                ),
                fillColor: Color.fromARGB(179, 231, 229, 229),
                border: UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                ),
                filled: true,
                enabled: true,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blueGrey,
                  ),
                ),
                fillColor: Color.fromARGB(179, 231, 229, 229),
                border: UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
