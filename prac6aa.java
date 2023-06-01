import java.util.*;

public class prac6aashish{
public static void main(String[] args) {
// char[] R={'A','B','C','D','E'}; //Relations
String[][] FD={{"A","BC"},{"CD","E"},{"B","D"},{"E","A"}}; //functional
dependencies
String[] closure={"A","B","E","C","D","BC","BD"};
int i,j,k,l,count=0,flag=-1;
for(i=0;i<closure.length;i++)
{
Set<Character> AC=new HashSet<Character>();
for(char c: closure[i].toCharArray())
AC.add(c);
for(j=0;j<FD.length;j++)
{
ArrayList<Character> A=new ArrayList<Character>(AC);
for(k=0;k<FD[j][0].length();k++)
{
for(int m=0;m<A.size();m++)
{
if(FD[j][0].charAt(k)==A.get(m))
{
flag=0;
break;
}
else if(m==A.size()-1)
{
flag=1;
break;
}
}
if(flag==1)
break;
}
if(flag==0)
{
int a=A.size();
for(l=0;l<FD[j][1].length();l++)
{
AC.add(FD[j][1].charAt(l));
}
int b=AC.size();
if(a==b)
{
count++;
}
}
else if(flag==1)
{
count++;
}
if(count==FD.length && j==FD.length-1)
{
count=0;
break;
}
else if(count!=FD.length && j==FD.length-1)
{
j=-1;
count=0;
}
}
System.out.println("Attribute closure of "+closure[i]+" is
"+AC+"\n");
}
}
}
