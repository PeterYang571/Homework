/*    CTS Common Type System

    //value type vs reference type
/*
 * 1. value types are created using enum or Struct but referency types are created using class, interface, array
 * 2. value types are stored in stack memory but reference type are stored in heap memory.
 * 3. value type can not accept null but reference type can accept null
 * 4. value type directly holds the value but referenc type holds the memory address of the value.
 * 5. garbage collector can collect only reference type
 * 
 * 
 * 
1. Find the factorial of a number
6x5x4x3x2x1
2. if a number is prime or not
3. if a year is leap or not
4. LCM of two number
*/

using System;

namespace ConsoleApp1
{
    /* #1 */
    //public class Factorial
    //{
    //    public static void Main(string[] args)
    //    {
    //        int i, fact = 1, number;
    //        Console.Write("Enter any Number: ");
    //        number = int.Parse(Console.ReadLine());
    //        for (i = 1; i <= number; i++)
    //        {
    //            fact = fact * i;
    //        }
    //        Console.Write("Factorial of " + number + " is: " + fact);
    //    }
    //}

    /* #2 */
    //public class PrimeNumberExample
    //{
    //    public static void Main(string[] args)
    //    {
    //        int n, i, m = 0, flag = 0;
    //        Console.Write("Enter the Number to check Prime: ");
    //        n = int.Parse(Console.ReadLine());
    //        m = n / 2;
    //        for (i = 2; i <= m; i++)
    //        {
    //            if (n % i == 0)
    //            {
    //                Console.Write("Number is not Prime.");
    //                flag = 1;
    //                break;
    //            }
    //        }
    //        if (flag == 0)
    //            Console.Write("Number is Prime.");
    //    }
    //}

    /* #3 */
    //public class Leap
    //{
    //    public static void Main(string[] args)
    //    {
    //        Console.WriteLine("Enter Year : ");
    //        int Year = int.Parse(Console.ReadLine());
    //        if (((Year % 4 == 0) && (Year % 100 != 0)) || (Year % 400 == 0)) Console.WriteLine("{0} is a Leap Year.", Year);
    //        else Console.WriteLine("{0} is not a Leap Year.", Year);
    //        Console.ReadLine();
    //    }
    //}

    /* #4 */
    public class LCM
    {
        public static void Main()
        {
            int i, n1, n2, max, lcm = 1;
            Console.Write("\n\n");
            Console.Write("Determine the LCM of two numbers:\n");
            Console.Write("-----------------------------------");
            Console.Write("\n\n");
            Console.Write("Input 1st number for LCM: ");
            n1 = Convert.ToInt32(Console.ReadLine());
            Console.Write("Input 2nd number for LCM: ");
            n2 = Convert.ToInt32(Console.ReadLine());
            max = (n1 > n2) ? n1 : n2;
            for (i = max; ; i += max)
            {
                if (i % n1 == 0 && i % n2 == 0)
                {
                    lcm = i;
                    break;
                }
            }
            Console.Write("\nLCM of {0} and {1} = {2}\n\n", n1, n2, lcm);
        }
    }
}






