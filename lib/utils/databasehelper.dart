import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tablylink/models/user.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tablylink.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        email TEXT NOT NULL UNIQUE,
        password TEXT NOT NULL,
        phone TEXT NOT NULL,
        profile_image TEXT DEFAULT '',
        date_of_birth TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE bookings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL,
        restaurant_name TEXT NOT NULL,
        restaurant_image TEXT,
        rating REAL,
        location TEXT,
        price_per_person REAL,
        date TEXT NOT NULL,
        time TEXT NOT NULL,
        guests INTEGER NOT NULL,
        tables INTEGER DEFAULT 1,
        zone TEXT,
        table_number TEXT,
        is_completed INTEGER DEFAULT 0,
        FOREIGN KEY (user_id) REFERENCES users(id)
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await db.execute('ALTER TABLE users ADD COLUMN date_of_birth TEXT');
    }
  }

  Future<int> registerUser({
    required String username,
    required String email,
    required String password,
    required String phone,
  }) async {
    final db = await database;
    return await db.insert('users', {
      'username': username,
      'email': email,
      'password': password,
      'phone': phone,
    });
  }

  Future<AppUser?> loginUser(String email, String password) async {
    final db = await database;
    final results = await db.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    if (results.isEmpty) return null;
    final row = results.first;
    final dobStr = row['date_of_birth'] as String?;
    return AppUser(
      id: row['id'] as int,
      username: row['username'] as String,
      email: row['email'] as String,
      phone: row['phone'] as String,
      profileImage: row['profile_image'] as String? ?? '',
      dateOfBirth: dobStr != null && dobStr.isNotEmpty
          ? DateTime.tryParse(dobStr)
          : null,
    );
  }

  Future<bool> isEmailTaken(String email) async {
    final db = await database;
    final results = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return results.isNotEmpty;
  }

  Future<AppUser?> getUserById(int id) async {
    final db = await database;
    final results = await db.query(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (results.isEmpty) return null;
    final row = results.first;
    final dobStr = row['date_of_birth'] as String?;
    return AppUser(
      id: row['id'] as int,
      username: row['username'] as String,
      email: row['email'] as String,
      phone: row['phone'] as String,
      profileImage: row['profile_image'] as String? ?? '',
      dateOfBirth: dobStr != null && dobStr.isNotEmpty
          ? DateTime.tryParse(dobStr)
          : null,
    );
  }

  Future<void> updateDateOfBirth(int userId, DateTime dateOfBirth) async {
    final db = await database;
    await db.update(
      'users',
      {'date_of_birth': dateOfBirth.toIso8601String()},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }

  Future<bool> verifyPassword(int userId, String password) async {
    final db = await database;
    final results = await db.query(
      'users',
      where: 'id = ? AND password = ?',
      whereArgs: [userId, password],
    );
    return results.isNotEmpty;
  }

  Future<void> changePassword(int userId, String newPassword) async {
    final db = await database;
    await db.update(
      'users',
      {'password': newPassword},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }
}
