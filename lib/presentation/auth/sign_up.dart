import 'package:electronicsshop_app/cores/app_exports.dart';

class ElectronicsAppSignup extends  ConsumerStatefulWidget {
  final Function toggleView;
  const ElectronicsAppSignup({super.key, required this.toggleView});

  @override
  ConsumerState<ElectronicsAppSignup> createState() => _ElectronicsAppSignupState();
}

class _ElectronicsAppSignupState extends ConsumerState<ElectronicsAppSignup> {
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = true;
  bool _isLoading = false;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 50),
                child: Center(child: Image.asset(ImageConstants.camImg, width: 100, height: 100)),
              ),
              const Text("Electro-Store", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              const Text("Register to Join the big store", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),),
              const SizedBox(height: 30,),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Username *', style: TextStyle(color: Colors.white),),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: _username,
                      style: const TextStyle(color: Colors.white),
                      decoration: textInputDecoration.copyWith(
                        suffixIcon: const Icon(Icons.person),
                        hintText: 'johndoe',
                        enabledBorder: inputBorder,

                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter username';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
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
                            onPressed: _isLoading ? null : _signUp,
                            child:_isLoading
                                ? const CircularProgressIndicator(color: Colors.white) :
                                const Text("SignUp", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                        ),
                      ),
                    ),
                    const SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text("Have an account?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        const SizedBox(width: 20,),
                        GestureDetector(
                            onTap: (){
                              widget.toggleView();
                            },
                            child: const Text("Login", style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),))
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


  void _signUp() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      final authRepo = ref.read(authRepositoryProvider);
      final errorModel = await authRepo.createUser(
        username: _username.text.trim(),
        email: _email.text.trim(),
        password: _password.text.trim(),
      );

      if (errorModel.error == null) {
        widget.toggleView();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(errorModel.data, style: const TextStyle(color: Colors.white),),
              backgroundColor: Colors.green,
          ),

        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(errorModel.error!, style: const TextStyle(color: Colors.white),),
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

