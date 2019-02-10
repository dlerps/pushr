using System;
using Pushr.Arguments;

namespace Pushr
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
