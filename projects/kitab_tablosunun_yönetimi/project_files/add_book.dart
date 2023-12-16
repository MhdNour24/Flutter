import 'package:flutter/material.dart';
import 'package:flutter_application_3/project_files/fireStore.dart';

class AddBook extends StatefulWidget {
  final String? docID;
  const AddBook({super.key, this.docID});
  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  late String? docID;
  @override
  void initState() {
    super.initState();
    docID = widget.docID;
  }

  final FireStoreServices firestoreService = FireStoreServices();
  TextEditingController kitapcontroller = TextEditingController();
  TextEditingController yayinevicontroller = TextEditingController();
  TextEditingController yazarlarcontroller = TextEditingController();
  TextEditingController sayfasayisicontroller = TextEditingController();
  TextEditingController basimyilicontroller = TextEditingController();
  bool checkbox = true;
  String categori = "Roman";
  String dropdownvalue = 'Roman';
  var kategoriler = [
    'Roman',
    'Tarih',
    'Edebiyat',
    'Şiir',
    'Ansiklopedi ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          "Kitap Ekle",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              textfield(hinttext: "Kitap adi", controller: kitapcontroller),
              textfield(hinttext: "YayınEvi", controller: yayinevicontroller),
              textfield(hinttext: "Yazarlar", controller: yazarlarcontroller),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: kategoriler.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                      categori = newValue;
                    });
                  },
                ),
              ),
              textfield(
                  hinttext: "Sayfa Sayısı", controller: sayfasayisicontroller),
              textfield(
                  hinttext: "Basım Yılı", controller: basimyilicontroller),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Listede yayınlanacak mı?             ",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Checkbox(
                      value: checkbox,
                      onChanged: (val) {
                        setState(() {
                          checkbox = !checkbox;
                        });
                      })
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color(0xFFF7F2F9),
                    borderRadius: BorderRadius.circular(30)),
                child: MaterialButton(
                  onPressed: () {
                    // add a new book
                    if (docID == null) {
                      firestoreService.addBook(
                          kitapcontroller.text,
                          yayinevicontroller.text,
                          yazarlarcontroller.text,
                          sayfasayisicontroller.text,
                          basimyilicontroller.text,
                          categori,
                          checkbox);
                    }
                    // update the book
                    else {
                      firestoreService.updateBook(
                          docID,
                          kitapcontroller.text,
                          yayinevicontroller.text,
                          yazarlarcontroller.text,
                          sayfasayisicontroller.text,
                          basimyilicontroller.text,
                          categori,
                          checkbox);
                    }
                    //clear the text controller
                    kitapcontroller.clear();
                    yayinevicontroller.clear();
                    yazarlarcontroller.clear();
                    sayfasayisicontroller.clear();
                    basimyilicontroller.clear();
                    categori = "Roman";
                    checkbox = true;
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Kaydet",
                    style: TextStyle(fontSize: 20, color: Color(0xFF715BAA)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textfield(
      {required String hinttext, required TextEditingController controller}) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(),
              focusColor: Colors.purple,
              hintText: hinttext,
              hintStyle: const TextStyle(fontSize: 20)),
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
