import 'package:bloc_pattern_kullanimi/cubit/anasayfa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfSayi1 = TextEditingController();
  var tfSayi2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Pattern"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<AnasayfaCubit, int>( //dinleme
                builder: (context, sonuc) {
                  return Text(
                    sonuc.toString(),
                    style: const TextStyle(fontSize: 50),
                  );
                },
              ),
              TextField(
                controller: tfSayi1,
                decoration: const InputDecoration(
                  hintText: "sayı 1",
                ),
              ),
              TextField(
                controller: tfSayi2,
                decoration: const InputDecoration(
                  hintText: "sayı 2",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<AnasayfaCubit>().toplamaYap(tfSayi1.text, tfSayi2.text);
                    },
                    child: const Text("toplama"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AnasayfaCubit>().carpmaYap(tfSayi1.text, tfSayi2.text);
                    },
                    child: const Text("çarpma"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
