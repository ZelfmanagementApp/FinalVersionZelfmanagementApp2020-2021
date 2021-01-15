//De mogelijkheid om een boodschap te liken
//Degene met de meeste likes moet bovenaan komen.
//Op dit moment kan er ook maar 1 keer geliked worden of het kan weer weggehaald worden. 
//Nogmaals dit is voor een demo

class Post {
  String body;
  String author;
  int likes = 0;
  bool userLiked = false;

  Post(this.body, this.author);

  void likePost() {
    this.userLiked = !this.userLiked;
    if (this.userLiked) {
      this.likes += 1;
    } else {
      this.likes -= 1;
    }
  }
}
