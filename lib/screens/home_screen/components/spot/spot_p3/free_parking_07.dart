part of 'spot_p3.dart';

class FreeParking07 extends StatelessWidget {
  FreeParking07({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, userState) {
      String userRole = userState is UserLoaded ? userState.users.role : "user";
      return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getPropertionateScreenWidht(10)),
        child: Column(
          children: [
            Row(
              children: [
                parkingBuilderVertical('65', userRole),
                parkingBuilderVertical('66', userRole),
                parkingBuilderVertical('67', userRole),
              ],
            ),
            Row(
              children: [
                parkingBuilderVertical('68', userRole),
                parkingBuilderVertical('69', userRole),
                parkingBuilderVertical('70', userRole),
              ],
            ),
            SizedBox(
              height: getPropertionateScreenHeight(20),
            ),
            SizedBox(
              height: getPropertionateScreenHeight(20),
            ),
            Row(
              children: [
                parkingBuilderVertical('71', userRole),
                parkingBuilderVertical('72', userRole),
                parkingBuilderVertical('73', userRole),
              ],
            ),
          ],
        ),
      );
    });
  }
}
