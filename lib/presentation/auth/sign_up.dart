import 'package:electronicsshop_app/cores/app_exports.dart';

class ElectronicsAppSignup extends StatefulWidget {
  const ElectronicsAppSignup({super.key});

  @override
  State<ElectronicsAppSignup> createState() => _ElectronicsAppSignupState();
}

class _ElectronicsAppSignupState extends State<ElectronicsAppSignup> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 50.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xFF1D3767),
              Color(0xFF1D3767),
              Color(0xFF1D3767),
            ], begin:Alignment.topLeft, end: Alignment.topRight)),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text('Create Your\nAccount',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 30.0),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name',
                      style: TextStyle(
                        color: Color(0xFF1D3767),
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Name",
                        prefixIcon: Icon(Icons.person_outline,
                        ),
                      ),
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(
                        color: Color(0xFF1D3767),
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Email",
                        prefixIcon: Icon(Icons.email_outlined,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40.0),
                    const Text(
                      'Password',
                      style: TextStyle(
                        color: Color(0xFF1D3767),
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        prefixIcon: Icon(Icons.password,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),

                    const SizedBox(height: 40.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ElectronicsShopLogin()));
                      },
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration( gradient: const LinearGradient(colors: [
                          Color(0xFF1D3767),
                          Color(0xFF1D3767),
                          Color(0xFF1D3767),
                        ], begin:Alignment.topLeft, end: Alignment.topRight), borderRadius: BorderRadius.circular(30)),
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height/7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const ElectronicsShopLogin()));
                              },
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                  color:   Color(0xFF1D3767),
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )

                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
