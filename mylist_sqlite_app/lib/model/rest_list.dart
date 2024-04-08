class RestList{
      int? seq;
      String name;
      String phone;
      String lat;
      String lng;
      String image;
      String estimate;
      String initdate;

      RestList({
            this.seq,
          required this.name,
          required this.phone,
          required this.lat,
          required this.lng,
          required this.image,
          required this.estimate,
          required this.initdate
      });

       RestList.fromMap(Map<String, dynamic> res) 
       :  seq = res['seq'],
         name = res['name'],
         phone = res['phone'],
         lat = res['lat'],
         lng = res['lng'],
         image = res['image'],
         estimate = res['estimate'],
         initdate = res['initdate'];

}