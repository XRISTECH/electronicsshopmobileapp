import 'package:electronicsshop_app/cores/app_exports.dart';

class ElectronicsShopLogin extends ConsumerStatefulWidget {
  final Function toggleView;
  const ElectronicsShopLogin({super.key, required this.toggleView});

  @override
  ConsumerState<ElectronicsShopLogin> createState() => _ElectronicsShopLoginState();
}

class _ElectronicsShopLoginState extends ConsumerState<ElectronicsShopLogin> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = true;
  bool _isLoading = false;
  bool _gLoading = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 50),
                  child: Center(child: Image.asset(ImageConstants.camImg, width: 100, height: 100)),
                ),
                const Text("Electro-Store", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                const Text("Join the big store", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
                const SizedBox(height: 30,),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Email *', style: TextStyle(color: Colors.white),),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: _email,
                        style: const TextStyle(color: Colors.white),
                        decoration: textInputDecoration.copyWith(
                            suffixIcon: const Icon(Icons.email),
                            hintText: 'example@email.com',
                            enabledBorder: inputBorder,

                        ),
                        validator: (value) {
                          return isValidEmail(value, isRequired: true)
                              ? null
                              : 'Enter a valid email address';
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const Text('Password *', style: TextStyle(color: Colors.white),),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        controller: _password,
                        style: const TextStyle(color: Colors.white),
                        decoration: textInputDecoration.copyWith(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword; // Toggle the password visibility
                              });
                            },
                            child: Icon(
                              _showPassword ? Icons.visibility_off : Icons.visibility
                            ),
                          ),
                          hintText: '******',
                          enabledBorder: inputBorder,

                        ),
                        validator: (value) {
                          return isValidPassword(value, isRequired: true);
                        },
                        obscureText: _showPassword ? true : false,
                      ),
                      const SizedBox(height: 20,),
                      Center(
                        child: SizedBox(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                              onPressed:_isLoading ? null : _login,
                              child: _isLoading
                                  ? const CircularProgressIndicator(color: Colors.white)
                                  : const Text(
                                "Login",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Center(child: Text("Or", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                      const SizedBox(height: 10,),
                      Center(
                        child: SizedBox(
                          width: 300,
                          height: 50,
                          child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.grey[300]),
                              onPressed: () async {
                                bool isLoggedIn;
                                setState(() {
                                  _gLoading = true;
                                });
                               isLoggedIn = await googleSignIn(ref, context);
                               if(!isLoggedIn){
                                 setState(() {
                                   _gLoading = false;
                                 });
                               }
                              },
                              icon: _gLoading ? null : Image.asset(
                                ImageConstants.googleIcon,
                                height: 40,
                              ),
                              label: _gLoading ? const CircularProgressIndicator(
                                strokeWidth: 2.0,
                                color: Colors.black,
                              ) : const Text(
                                'sign in with google',
                                style: TextStyle(color: Colors.black),
                              )),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("New Here?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          const SizedBox(width: 20,),
                          GestureDetector(
                            onTap: (){
                              widget.toggleView();
                            },
                              child: const Text("Sign Up", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),))
                        ],
                      )
                    ],
                  ),

                )
              ],
            ),
          ),
        )
    );

  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final authRepo = ref.read(authRepositoryProvider);
      final errorModel = await authRepo.loginUser(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );
      if (errorModel.error == null && errorModel.data != null) {
        ref.read(userProvider.notifier).state = errorModel.data;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorModel.error ?? "Login failed"),
            backgroundColor: Colors.red,
          ),
        );
      }

      setState(() {
        _isLoading = false;
      });
    }
  }
}


