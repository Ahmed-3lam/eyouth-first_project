import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'note_controller.dart';
import 'note_model.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Note App",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                NoteController.clearAllNotes();
                setState(() {});
              },
              child: Icon(Icons.delete),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: NoteController.noteList.length,
          itemBuilder: (context, index) => _buildNoteItem(
              color: Colors.blue,
              index: index,
              noteModel: NoteController.noteList[index]),
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Padding _buildNoteItem({
    required Color color,
    required NoteModel noteModel,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20.0,
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          InkWell(
            onTap: () async {
              _titleController.text = noteModel.title;
              await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Update a new Note'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: _titleController,
                          autofocus: true,
                          decoration: const InputDecoration(
                              hintText: "Enter your title."),
                        ),
                        TextField(
                          controller: _descriptionController,
                          autofocus: true,
                          decoration: const InputDecoration(
                              hintText: "Enter your description."),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          _titleController.text = "";
                          Get.back();
                        },
                      ),
                      TextButton(
                        child: Text('Update'),
                        onPressed: () {
                          NoteController.updateNote(
                            index: index,
                            title: _titleController.text,
                            desc: _descriptionController.text,
                          );
                          _titleController.text = "";
                          _descriptionController.text = "";
                          setState(() {});
                          Navigator.pop(
                            context,
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(.5),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    noteModel.title,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    noteModel.description,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                NoteController.removeSingleNote(index: index);
                setState(() {});
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ))
        ],
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      onPressed: () async {
        await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Add a new Note'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _titleController,
                    autofocus: true,
                    decoration:
                        const InputDecoration(hintText: "Enter your Title."),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                        hintText: "Enter your description."),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    _titleController.text = "";
                    Get.back();
                  },
                ),
                TextButton(
                  child: Text('Add'),
                  onPressed: () {
                    NoteController.addNote(
                        model: NoteModel(
                            title: _titleController.text,
                            description: _descriptionController.text));
                    _titleController.text = "";
                    _descriptionController.text = "";
                    setState(() {});

                    ///Still will adding our logic
                    Navigator.pop(
                      context,
                    );
                  },
                ),
              ],
            );
          },
        );
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}

/// Add Note
/// Remove Note
/// Remove All Notes
/// Update Note
///
/// MVC (MODEl View Controller )
