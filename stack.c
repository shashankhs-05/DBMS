#include<stdlib.h>
#include<stdio.h>
#include<conio.h>
int top=-1,item,a[10];
void push(){
    int b;
    if(top>=10)
    {printf("Overflow");
    return;}
    printf("Enter no.:");
    scanf("%d",&b);
    top++;
    a[top]=b;
}
void pop(){
    if(top==-1)
    {printf("Underflow");
    return;}
    printf("Deleted no.=%d\n",a[top--]);
}
void display(){
    if(top==-1)
    {printf("Empty");
    return;}
    for(int i=top;i>-1;i--)
    printf("%d\t",a[i]);
}
int main()
{
    int choice;
   
    while(1){
         printf("\nEnter choice\n1.Push\n2.Pop\n3.Display\n4.Exit");
    scanf("%d",&choice);
    switch(choice)
    {
        case 1:push();
        break;
        case 2:pop();
        break;
        case 3:display();
        break;
        case 4:exit(0);
        default :printf("Invalid");
        
    }}
    return 0;
}
