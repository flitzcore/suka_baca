import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:baca_suka/database/rangkuman.dart';


class RangkumanDatabase{
  static final RangkumanDatabase instance= RangkumanDatabase._init();
  static Database? _database;
  RangkumanDatabase._init();

  Future<Database> get database async{
    if(_database != null) return _database!;
    _database=await _initDB('rangkuman.db');
    return _database!;
  }
  Future<Database> _initDB(String filePath)async{
    final dbPath= await getDatabasesPath();
    final path= join(dbPath,filePath);
    print("db location: ${path}");
    return await openDatabase(path,version: 1,onCreate: _createDB);
  }
  Future _createDB(Database db, int version)async {
    final idType= 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType='BOOLEAN NOT NULL';
    final textType='TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE $tableRangkuman (
      ${RangkumanFields.id} $idType,
      ${RangkumanFields.favorit} $boolType,
      ${RangkumanFields.on_progress} $boolType,
      ${RangkumanFields.judul} $textType, 
      ${RangkumanFields.nama_pengarang} $textType, 
      ${RangkumanFields.deskripsi} $textType,
      ${RangkumanFields.image_path} $textType,
      ${RangkumanFields.horror} $boolType,
      ${RangkumanFields.petualangan} $boolType,
      ${RangkumanFields.pengenalan_diri} $boolType,
      ${RangkumanFields.komedi} $boolType,
      ${RangkumanFields.romansa} $boolType,
      ${RangkumanFields.fiksi} $boolType,
      ${RangkumanFields.thriller} $boolType,
      ${RangkumanFields.misteri} $boolType
    )
    ''');
  }
  Future<Rangkuman> create(Rangkuman rangkuman) async{
    final db=await instance.database;
    final id= await db.insert(tableRangkuman, rangkuman.toJson());
    return rangkuman.copy(id:id);
  }

  Future<Rangkuman> readRangkuman (int id) async{
    final db= await instance.database;
    final maps= await db.query(
        tableRangkuman,
        columns: RangkumanFields.values,
        where: '${RangkumanFields.id} =?',
        whereArgs: [id],
    );

    if (maps.isNotEmpty){
      return Rangkuman.fromJson(maps.first);
    }else{
      throw Exception('ID $id not found');
    }

  }
  Future <List<Rangkuman>> readAll() async{
    final db=await instance.database;
    final result= await db.query(tableRangkuman);
    return result.map((json) => Rangkuman.fromJson(json)).toList();
  }
  Future <int> update (Rangkuman rangkuman) async{
    final db= await instance.database;
    return db.update(
        tableRangkuman,
        rangkuman.toJson(),
        where: '${RangkumanFields.id}=?',
        whereArgs: [rangkuman.id]
    );
  }
  Future<int> delete(int id)async{
    final db= await instance.database;
    return db.delete(
        tableRangkuman,
        where: '${RangkumanFields.id}=?',
        whereArgs: [id]
    );
  }

  Future close()async{
    final db= await instance.database;
    db.close();
  }
}

