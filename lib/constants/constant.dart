import 'package:flutter/material.dart';

import 'color.dart';

const kMarginTopBottom = EdgeInsets.only(top: 35, bottom: 20);

const double kIconSize35 = 35;
const double kIconSize25 = 25;
const double kIconSize20 = 20;
const double kIconSize15 = 15;

const kPadLeft = EdgeInsets.only(left: 10.0);

const kSizedBoxWidth10 = SizedBox(width: 10);
const kSizedBoxWidth15 = SizedBox(width: 15);
const kSizedBoxWidth5 = SizedBox(width: 5);

const kSizedBoxHeight5 = SizedBox(height: 5);
const kSizedBoxHeight10 = SizedBox(height: 10);
const kSizedBoxHeight15 = SizedBox(height: 15);
const kSizedBoxHeight20 = SizedBox(height: 20);
const kSizedBoxHeight30 = SizedBox(height: 30);
const kSizedBoxHeight70 = SizedBox(height: 70);

const kAudioCardDivider = Padding(
  padding: EdgeInsets.only(bottom: 10.0, right: 10, left: 10),
  child: SizedBox(
    child: Divider(
      thickness: 1,
      color: kGreyColor,
    ),
  ),
);

const kBottomDivider = BoxDecoration(
  border: Border(
    bottom: BorderSide(color: kGreyColor),
  ),
);

const kDefaultAudioImage = DecorationImage(
    image: AssetImage('images/audio_image.jpg'), fit: BoxFit.cover);

const kUserProfileIcon50 = CircleAvatar(
  radius: 50,
  backgroundColor: kSecondaryColor,
  backgroundImage: AssetImage('images/empty_user.png'),
);

const kDivider = Divider(
  thickness: 1,
  color: kGreyColor,
);

const kSuccessResult = "Success";

const kDefaultPhotoURL =
    "https://firebasestorage.googleapis.com/v0/b/preacher-777.appspot.com/o/default_images%2Fempty_user.png?alt=media&token=7c955e6b-2743-45cb-8c7b-b5ffb98fcd15";

const kDefaultTackImg =
    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.tenforums.com%2Ftutorials%2F102323-change-default-audio-playback-device-windows-10-a.html&psig=AOvVaw1fGpJhkdIcZHEgzaKkzsTD&ust=1682406230102000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCPi86N_5wf4CFQAAAAAdAAAAABAF';

const kFreeAccount = "Free plan";
