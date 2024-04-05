class Students{
  int? id;
  String code;
  String name;
  String dept;
  String phone;

  Students({
    this.id,
    required this.code,
    required this.name,
    required this.dept,
    required this.phone

  });

  Students.fromMap(Map<String,dynamic> res) 
      :  id = res['id'],
        code = res['code'],
        name = res['name'],
        dept = res['dept'],
        phone = res['phone'];
    
}