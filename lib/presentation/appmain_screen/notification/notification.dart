import 'package:electronicsshop_app/cores/app_exports.dart';

class NotificationPage extends StatefulWidget {
  final Function onSwitch;
  const NotificationPage({super.key, required this.onSwitch});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String, dynamic>> notifications = [
    {"title": "Order Shipped", "message": "Your order #12345 has been shipped!", "time": "10 mins ago", "isRead": false},
    {"title": "New Discount!", "message": "Get 20% off on all items today!", "time": "1 hour ago", "isRead": false},
    {"title": "Delivery Update", "message": "Your order #54321 is out for delivery.", "time": "2 hours ago", "isRead": true},
    {"title": "Payment Received", "message": "Your payment for order #67890 was successful.", "time": "Yesterday", "isRead": true},
  ];

  void markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification["isRead"] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Notifications", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final notification = notifications[index];
            return Dismissible(
              key: Key(notification["title"]),
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                color: Colors.red,
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                setState(() {
                  notifications.removeAt(index);
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: notification["isRead"] ? Colors.grey.shade300 : Colors.blue.shade100,
                    child: Icon(notification["isRead"] ? Icons.notifications_none : Icons.notifications_active, color: notification["isRead"] ? Colors.grey : Colors.blue),
                  ),
                  title: Text(notification["title"], style: TextStyle(fontWeight: notification["isRead"] ? FontWeight.normal : FontWeight.bold)),
                  subtitle: Text(notification["message"]),
                  trailing: Text(notification["time"], style: const TextStyle(color: Colors.grey, fontSize: 12)),
                  tileColor: notification["isRead"] ? Colors.grey[300] : Colors.blue.shade50,
                  onTap: () {
                    setState(() {
                      notifications[index]["isRead"] = true;
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
