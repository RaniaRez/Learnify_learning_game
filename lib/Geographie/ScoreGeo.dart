class ScoreGeo{
  bool testFait;
  int niv1;
  int niv2;
  int niv3;

  ScoreGeo(bool test,int niv1 , int niv2 , int niv3 ){
    this.testFait=test ;
    this.niv1=niv1;
    this.niv2=niv2;
    this.niv3=niv3;
  }
  int somme (){
    return (this.niv1 + this.niv2 +this.niv3 );
  }
}