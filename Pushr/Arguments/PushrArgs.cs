using System.Text;

namespace Pushr.Arguments
{
    public struct PushrArgs
    {
        public string Host { get; set; }

        public string User { get; set; }

        public string Password { get; set; }

        public string RemotePath { get; set; }

        public int Port { get; set; }

        public override string ToString()
        {
            StringBuilder output = new StringBuilder();
            output.AppendLine($"Host -> {Host}:{Port}{RemotePath}");
            output.AppendLine($"Login -> {User}:{Password}");

            return output.ToString();
        }
    }
}