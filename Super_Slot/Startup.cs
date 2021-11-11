using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Super_Slot.Startup))]
namespace Super_Slot
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
