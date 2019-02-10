using System;
using pushr.Arguments;

namespace pushr
{
    public class Program
    {
        public static void Main(string[] args)
        {
            PushrArgs pArgs = args.ReadArgs();
            Console.WriteLine(pArgs);
        }
    }
}
