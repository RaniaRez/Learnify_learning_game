class ScoreMaths{
  bool testFait;
  int niv1;
  int niv2;
  int niv3;

  ScoreMaths(bool test,int niv1 , int niv2 , int niv3 ){
    this.testFait=test ;
    this.niv1=niv1;
    this.niv2=niv2;
    this.niv3=niv3;
  }

  int somme (){
    int n1 , n2 , n3 ;
    if (this.niv1<0){n1=0;}
    else {n1=this.niv1;}
    if (this.niv2<0){n2=0;}
    else {n2=this.niv2;}
    if (this.niv3<0){n3=0;}
    else {n3=this.niv3;}
    return (n1+n2+n3 );
  }
}