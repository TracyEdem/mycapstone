import 'package:flutter/material.dart';

class ClientCard extends StatelessWidget {
  final String clientName;
  final double balance;
  final int projectNum;
  final String gender;

  const ClientCard({
    Key? key,
    required this.clientName,
    required this.balance,
    required this.projectNum,
    required this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          _showSimpleModalDialog(
              context, clientName, balance, gender, projectNum);
        },
        child: Card(
          color: Colors.white,
          elevation: 5,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(
                  clientName,
                  style: const TextStyle(color: Colors.black87),
                ),
                subtitle: Text(
                  gender,
                  style: const TextStyle(color: Colors.black87),
                ),
                trailing: Text(
                  'GHS $balance',
                  style: const TextStyle(color: Color.fromARGB(179, 255, 0, 0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

_showSimpleModalDialog(
    context, String name, double balance, String gender, int projects) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 550),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color.fromARGB(255, 176, 176, 176),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text('Name: '),
                          const Spacer(),
                          Text(name),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color.fromARGB(255, 176, 176, 176),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text('Gender: '),
                          const Spacer(),
                          Text(gender),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color.fromARGB(255, 176, 176, 176),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Text('Balance: '),
                          const Spacer(),
                          Text(balance.toString()),
                        ],
                      ),
                    ),
                    Container(
                      height: 30,
                      child: Row(
                        children: [
                          const Text('Total Projects: '),
                          const Spacer(),
                          Text(projects.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}
