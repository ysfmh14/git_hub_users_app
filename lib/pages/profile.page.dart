import 'package:flutter/material.dart';
class Profil extends StatefulWidget {
  const Profil({super.key});


  @override
  State<Profil> createState() => _Profil();
}

class _Profil extends State<Profil> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.account_circle),
            icon: Icon(Icons.account_circle),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Badge(child: Icon(Icons.folder)),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.messenger_sharp),
            ),
            label: 'Messages',
          ),
        ],
      ),
      body: <Widget>[

        /// Home page
        ///
        Padding(
          padding: const EdgeInsets.only(top: 200,left: 0),

            child: Column(
              children: [CircleAvatar(
                backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/20009943?v=4"),
                radius: 70, // Ajustez le rayon de l'avatar selon votre besoin
              ),
                SizedBox(height: 20,),
                Text("Youssef MAHDOUBI",style: TextStyle(
                  fontSize: 20,
                ),),

                SizedBox(height: 120),
                Row(
                  children: [
                    SizedBox(
                      width: 220, // Pour étendre la carte sur toute la largeur
                      height: 150,
                      child: Card(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.white,
                        margin: EdgeInsets.only(top: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0), // Ajustez les marges de la carte selon votre besoin
                          child: Icon(Icons.supervised_user_circle,size: 50,color: Colors.blueAccent,),
                        ),
                      ),

                    ),
                    SizedBox(
                      width: 220, // Pour étendre la carte sur toute la largeur
                      height: 150,
                      child: Card(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.white,
                        margin: EdgeInsets.only(top: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0), // Ajustez les marges de la carte selon votre besoin
                          child:Column(children: [Icon(Icons.folder,size: 50,color: Colors.blueAccent,),
                            Text("100")
                          ],)
                        ),
                      ),

                    ),
                  ],
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 220, // Pour étendre la carte sur toute la largeur
                      height: 150,
                      child: Card(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.white,
                        margin: EdgeInsets.only(top: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0), // Ajustez les marges de la carte selon votre besoin
                          child: Icon(Icons.supervised_user_circle,size: 50,color: Colors.blueAccent,),
                        ),
                      ),

                    ),
                    SizedBox(
                      width: 220, // Pour étendre la carte sur toute la largeur
                      height: 150,
                      child: Card(
                        color: Colors.white,
                        surfaceTintColor: Colors.white,
                        shadowColor: Colors.white,
                        margin: EdgeInsets.only(top: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0), // Ajustez les marges de la carte selon votre besoin
                          child: Icon(Icons.supervised_user_circle,size: 50,color: Colors.blueAccent,),
                        ),
                      ),

                    ),
                  ],
                ),


     ]
            ),
        ),
        // Card(
        //   shadowColor: Colors.transparent,
        //   margin: EdgeInsets.o(8.0),
        //   child: SizedBox.expand(
        //     child: Center(
        //       child: CircleAvatar(backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/20009943?v=4"),
        //       radius: 70,
        //       ),
        //
        //
        //     ),
        //   ),
        // ),

        /// Notifications page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hi!',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
          },
        ),
      ][currentPageIndex],
    );
  }}