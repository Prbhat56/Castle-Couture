import '../../../../core/app_export.dart';

class CompletedBooking extends StatelessWidget {
  const CompletedBooking({
    super.key,
    this.height,
  });

  final double? height;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: height ?? size.height * 0.76,
      child: ListView.builder(
        //  physics: const NeverScrollableScrollPhysics(),
        //   physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        //  shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Column(
              children: [
                Container(
                  //     padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 15,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://media.istockphoto.com/id/1174677878/photo/back-of-beautiful-bride-with-bridal-bunch.jpg?s=612x612&w=0&k=20&c=mPciyB8mXI6vNvagXKC8E9h22sz4Qgso587qy3PpMH8='),
                                  // Add your image asset here
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: size.height * 0.18,
                            ),
                            const SizedBox(height: 16.0),
                            // Bridal Package
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Bridal Package',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '1 hour',
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Date & Time',
                                  style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  '12 Jan, 02:00 PM',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            // Divider
                            Divider(
                              color: Colors.grey[100],
                            ),
                            const SizedBox(height: 8.0),
                            // Profile
                            const Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://cdn.pixabay.com/photo/2016/06/29/08/41/wedding-dresses-1486256_1280.jpg'),
                                  // Add your profile image asset here
                                  radius: 20.0,
                                ),
                                SizedBox(width: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'John Doe',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text('Stylist'),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16.0),
                            // Description
                            const Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                              'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                              'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris '
                              'nisi ut aliquip ex ea commodo consequat.',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                            softWrap: true,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        alignment: Alignment.center,
                        //  width: size.width * 0.100,
                        decoration: const BoxDecoration(
                            color: CustomColors.primaryOrange,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),

                        child: const Text(
                          'Completed',
                          style: TextStyle(fontSize: 15.0, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
