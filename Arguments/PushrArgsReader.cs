using System;
using System.Linq;
using DDev.Tools.Extensions;

namespace pushr.Arguments
{    
    public static class PushrArgsReader
    {
        private const int USER_INDEX = 0;
        private const int PASSWORD_INDEX = 1;
        private const int HOST_INDEX = 2;
        private const int DIR_INDEX = 3;

        public static PushrArgs ReadArgs(this string[] args)
        {
            string[] host = args[HOST_INDEX].Split(':');

            return new PushrArgs
            {
                User = args[USER_INDEX],
                Password = args[PASSWORD_INDEX],
                Host = GetHost(host),
                Port = GetPort(host),
                RemotePath = GetDirectory(args)
            };
        }

        private static int GetPort(string[] host)
        {
            int? port = null;

            try
            {
                if (host.Count() == 2)
                    port = host[1].ToInteger();
            }
            catch (Exception) { }

            return port ?? 21;
        }

        public static string GetHost(string[] host)
        {
            host[0] = host[0].ToLower();
            return host[0].Replace("ftp://", String.Empty);
        }

        private static string GetDirectory(string[] args)
        {
            return String.IsNullOrWhiteSpace(args[DIR_INDEX]) 
                ? "/" 
                :  $"/{args[DIR_INDEX].TrimStart('/')}";
        }
    }
}