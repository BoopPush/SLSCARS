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
            services.AddCors(options => options.AddPolicy("ApiCorsPolicy", builder =>
            {
                builder.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader();
            }));
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
        }

        public void Configure(IApplicationBuilder app)
        {
            app.UseRouting();

            app.UseCors("ApiCorsPolicy");

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

        }

    }
}
