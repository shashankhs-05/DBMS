import java.util.Scanner;
public class sha {
  public static void main(String[] args) {
Scanner sc=new Scanner(System.in);
try {
System.out.println("Enter Pr");
double pr=sc.nextDouble();
System.out.println("Enter Rate");
double rate=sc.nextDouble();
System.out.println("Enter Time");
int time=sc.nextInt();
Box b=new Box(pr,rate,time);
System.out.println("Simple Int= "+b.si());}
catch(java.util.InputMismatchException e) {
System.out.println("Enter a number bruh!!!!!!!!");}
  }
}

class Box{
double pr,rate;
int time;
Box(double pr,double rate,int time)
{
this.pr=pr;
this.rate=rate;
this.time=time;}
double si(){
return (pr*rate*time)/100;}}
