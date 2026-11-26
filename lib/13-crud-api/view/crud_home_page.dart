import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../model/post.dart';

// Modul 13: CRUD (Create, Read, Update, Delete) dengan REST API JSONPlaceholder.
class CrudHomePage extends StatefulWidget {
  const CrudHomePage({super.key});

  @override
  State<CrudHomePage> createState() => _CrudHomePageState();
}

class _CrudHomePageState extends State<CrudHomePage> {
  // State: post yang berhasil dibuat/diupdate (null = belum ada data)
  Post? createdPost;

  static const Map<String, String> _headers = {
    'Content-type': 'application/json; charset=UTF-8',
  };

  void _snack(String message, {Color? color}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
  }

  // CREATE: HTTP POST
  Future<void> createPost(String title, String body) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    try {
      final response = await http.post(
        url,
        headers: _headers,
        body: jsonEncode({'title': title, 'body': body, 'userId': 1}),
      );

      if (!mounted) return;

      // Status code 201 menandakan sukses
      if (response.statusCode == 201) {
        final data = jsonDecode(response.body);
        setState(() {
          createdPost = Post.fromJson(data);
        });
      } else {
        _snack('Gagal menambahkan post');
      }
    } catch (e) {
      _snack('Error: $e');
    }
  }

  // UPDATE: HTTP PUT (JSONPlaceholder mendukung id 1 untuk demo)
  Future<void> updatePost(int id, String title, String body) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

    try {
      final response = await http.put(
        url,
        headers: _headers,
        body: jsonEncode({'id': 1, 'title': title, 'body': body, 'userId': 1}),
      );

      if (!mounted) return;

      // Status code 200 OK menandakan update berhasil
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          // Waktu pembuatan asli dipertahankan
          createdPost = Post(
            id: data['id'],
            userId: data['userId'] ?? createdPost!.userId,
            title: data['title'],
            body: data['body'],
            createdAt: createdPost!.createdAt,
          );
        });
        _snack('Post berhasil diupdate!', color: Colors.green);
      } else {
        _snack('Gagal mengupdate post');
      }
    } catch (e) {
      _snack('Error: $e');
    }
  }

  // DELETE: HTTP DELETE
  Future<void> deletePost(int id) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/$id');

    try {
      final response = await http.delete(url, headers: _headers);

      if (!mounted) return;

      // Status code 200 OK menandakan delete berhasil
      if (response.statusCode == 200) {
        _snack('Post berhasil dihapus!', color: Colors.green);
        // State dikembalikan ke null agar UI kembali ke tampilan awal
        setState(() {
          createdPost = null;
        });
      } else {
        _snack('Gagal menghapus post', color: Colors.red);
      }
    } catch (e) {
      _snack('Error: $e', color: Colors.red);
    }
  }

  void showDeleteConfirmationDialog(int id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Hapus'),
        content: const Text('Apakah Anda yakin ingin menghapus post ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              deletePost(id);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }

  void showAddPostDialog() {
    final titleController = TextEditingController();
    final bodyController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Tambah Post'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(labelText: 'Pekerjaan'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              final title = titleController.text.trim();
              final body = bodyController.text.trim();
              if (title.isNotEmpty && body.isNotEmpty) {
                createPost(title, body);
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Nama dan Pekerjaan harus diisi'),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo[900],
              foregroundColor: Colors.white,
            ),
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }

  void showUpdatePostDialog(Post currentPost) {
    final titleController = TextEditingController(text: currentPost.title);
    final bodyController = TextEditingController(text: currentPost.body);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Update Post'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: bodyController,
              decoration: const InputDecoration(labelText: 'Pekerjaan'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            onPressed: () {
              final updatedTitle = titleController.text.trim();
              final updatedBody = bodyController.text.trim();

              if (updatedTitle.isNotEmpty && updatedBody.isNotEmpty) {
                updatePost(currentPost.id, updatedTitle, updatedBody);
                Navigator.pop(context);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Nama dan Pekerjaan harus diisi'),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo[900],
              foregroundColor: Colors.white,
            ),
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        title: Text(
          'Demo CRUD client-server',
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo[900],
        elevation: 4,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: createdPost == null
            ? Text(
                'Demo CRUD client-server di Flutter',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.indigo[900],
                ),
              )
            : ListView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Card(
                      elevation: 8,
                      shadowColor: Colors.indigo.withValues(alpha: 0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    createdPost!.title,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.indigo[900],
                                    ),
                                  ),
                                ),
                                PopupMenuButton<String>(
                                  itemBuilder: (context) => const [
                                    PopupMenuItem(
                                      value: 'update',
                                      child: Text('Update'),
                                    ),
                                    PopupMenuItem(
                                      value: 'delete',
                                      child: Text('Delete'),
                                    ),
                                  ],
                                  onSelected: (value) {
                                    if (value == 'update') {
                                      if (createdPost != null) {
                                        showUpdatePostDialog(createdPost!);
                                      }
                                    } else if (value == 'delete') {
                                      if (createdPost != null) {
                                        showDeleteConfirmationDialog(
                                          createdPost!.id,
                                        );
                                      }
                                    }
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Text(
                              createdPost!.body,
                              style: GoogleFonts.openSans(
                                fontSize: 18,
                                height: 1.5,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'id: ${createdPost!.id}',
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                color: Colors.blueGrey[600],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'userID: ${createdPost!.userId}',
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                color: Colors.blueGrey[600],
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              DateFormat(
                                "dd MMMM yyyy, HH:mm 'WIB'",
                              ).format(createdPost!.createdAt),
                              style: GoogleFonts.openSans(
                                fontSize: 14,
                                color: Colors.blueGrey[600],
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddPostDialog,
        backgroundColor: Colors.indigo[900],
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Icon(Icons.add, size: 28),
      ),
    );
  }
}
