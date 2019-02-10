using FluentAssertions;
using Pushr.Arguments;
using Xunit;

namespace Pushr.Test.Arguments
{
    public class PushrArgsReader_When_reading
    {
        [Fact]
        public void Then_username_is_mapped()
        {
            // Arrange
            string username = "Kate_de_Vries";
            string[] args = new string[] { username, "pass", "localhost:21", "/" };

            // Act
            PushrArgs pArgs = args.ReadArgs();

            // Assert
            pArgs.User.Should().Be(username);
        }

        [Fact]
        public void Then_password_is_mapped()
        {
            // Arrange
            string password = "Aurora123";
            string[] args = new string[] { "Matt_Cruise", password, "localhost:21", "/" };

            // Act
            PushrArgs pArgs = args.ReadArgs();

            // Assert
            pArgs.Password.Should().Be(password);
        }
    }
}