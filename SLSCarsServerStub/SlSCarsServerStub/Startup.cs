using SlSCarsServerStub.Common;
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace SlSCarsServerStub
{
    public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(Directory.GetCurrentDirectory())
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true);
            IConfiguration configuration = builder.Build();
            //var conn = configuration.GetConnectionString("sls");
            //var ctx = new SqlConnection(conn);
            //ctx.Open();
            services.AddMvc(options =>
        {
            options.InputFormatters.Insert(0, new RawJsonBodyInputFormatter());
        });
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
