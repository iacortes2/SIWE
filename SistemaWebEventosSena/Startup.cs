using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SistemaWebEventosSena.Startup))]
namespace SistemaWebEventosSena
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
