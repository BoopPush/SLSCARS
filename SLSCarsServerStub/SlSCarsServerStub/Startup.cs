using System;
using System.Configuration;
using System.Data.SqlClient;

namespace SlSCarsServerStub
{
    public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();
            services.AddCors();
        }

        public void Configure(IApplicationBuilder app)
        {
            app.UseRouting();

            app.UseCors(builder => builder.AllowAnyOrigin());

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

        }

    }
}
