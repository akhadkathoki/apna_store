const logo = "assets/images/logo.png";
const starterImage = "assets/images/shopping_first_page.png";
const profile = "assets/images/profile1.jpg";
const successTick = "assets/images/successTick.png";
const profile2 =
    "data:image/jpeg;base64,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";
const productImg =
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsdyyEmnQ1Wp5wzbHVCDfYEHD_NK6-udWayA&s";