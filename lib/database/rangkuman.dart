final String tableRangkuman = 'rangkuman';
class RangkumanFields{

  static final List<String> values = [
    id,favorit,judul,deskripsi,nama_pengarang,on_progress,image_path,horror,petualangan,pengenalan_diri,komedi,romansa,fiksi,thriller,misteri
  ];
  static final String id='_id';
  static final String favorit='favorit';
  static final String judul='judul';
  static final String deskripsi='deskripsi';
  static final String nama_pengarang='author';
  static final String image_path='image_path';
  static final String on_progress='onprogress';
  static final String horror='horror';
  static final String petualangan='petualangan';
  static final String pengenalan_diri='pengenalan_diri';
  static final String komedi='komedi';
  static final String romansa='romansa';
  static final String fiksi='fiksi';
  static final String thriller='thriller';
  static final String misteri='misteri';
}
class Rangkuman {
  final int? id;
  final bool favorit;
  final bool onProgress;
  final String nama_pengarang;
  final String judul;
  final String deskripsi;
  final String image_path;
  final bool horror;
  final bool petualangan;
  final bool pengenalan_diri;
  final bool komedi;
  final bool romansa;
  final bool fiksi;
  final bool thriller;
  final bool misteri;
  const Rangkuman({
    this.id,
    required this.onProgress,
    required this.nama_pengarang,
    required this.favorit,
    required this.deskripsi,
    this.image_path='',
    required this.judul,
    //genre
    this.horror=false,
    this.petualangan=false,
    this.pengenalan_diri=false,
    this.komedi=false,
    this.romansa=false,
    this.fiksi=false,
    this.thriller=false,
    this.misteri=false
});
  Rangkuman copy({
    int? id,
    bool? favorit,
    bool? onProgress,
    String? nama_pengarang,
    String? judul,
    String? deskripsi,
    String? image_path,
    bool?  horror,
    bool? petualangan,
    bool? pengenalan_diri,
    bool? komedi,
    bool? romansa,
    bool? fiksi,
    bool? thriller,
    bool? misteri,
})=>Rangkuman(
      id: id ?? this.id,
      favorit: favorit ?? this.favorit,
      onProgress: onProgress ?? this.onProgress,
      nama_pengarang: nama_pengarang ?? this.nama_pengarang,
      deskripsi: deskripsi ?? this.deskripsi,
      image_path: image_path ?? this.image_path,
      judul: judul ?? this.judul,
      horror: horror ?? this.horror,
      petualangan: petualangan ?? this.petualangan,
      pengenalan_diri: pengenalan_diri ?? this.pengenalan_diri,
      komedi: komedi ?? this.komedi,
      romansa: romansa ?? this.romansa,
      fiksi:  fiksi ?? this.fiksi,
      thriller: thriller ?? this.thriller,
      misteri: misteri ?? this.misteri
  );
  static  Rangkuman fromJson(Map<String, Object?>json)=>Rangkuman(
      id: json[RangkumanFields.id] as int?,
      favorit: json[RangkumanFields.favorit] == 1,
      onProgress: json[RangkumanFields.on_progress] == 1,
      nama_pengarang: json[RangkumanFields.nama_pengarang] as String,
      deskripsi: json[RangkumanFields.deskripsi] as String,
      image_path: json[RangkumanFields.image_path] as String,
      judul: json[RangkumanFields.judul] as String,
      horror: json[RangkumanFields.horror] == 1,
      petualangan: json[RangkumanFields.petualangan] == 1,
      pengenalan_diri: json[RangkumanFields.pengenalan_diri] == 1,
      komedi: json[RangkumanFields.komedi] == 1,
      romansa: json[RangkumanFields.romansa] == 1,
      fiksi: json[RangkumanFields.fiksi] == 1,
      thriller: json[RangkumanFields.thriller] == 1,
      misteri: json[RangkumanFields.misteri] == 1,
  );
  Map <String, Object?> toJson()=>{
    RangkumanFields.id: id,
    RangkumanFields.favorit: favorit ? 1:0,
    RangkumanFields.on_progress: onProgress ? 1:0,
    RangkumanFields.nama_pengarang: nama_pengarang,
    RangkumanFields.judul: judul,
    RangkumanFields.deskripsi: deskripsi,
    RangkumanFields.image_path: image_path,
    RangkumanFields.horror: horror ? 1:0,
    RangkumanFields.petualangan: petualangan ? 1:0,
    RangkumanFields.pengenalan_diri: pengenalan_diri ? 1:0,
    RangkumanFields.komedi: komedi ? 1:0,
    RangkumanFields.romansa: romansa ? 1:0,
    RangkumanFields.fiksi: fiksi ? 1:0,
    RangkumanFields.thriller: thriller ? 1:0,
    RangkumanFields.misteri: misteri ? 1:0,

  };
}