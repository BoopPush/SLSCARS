using NLog;
using NLog.Web;

namespace SlSCarsServerStub
{
    public class Program
    {
        private static readonly Logger log_ = LogManager.GetLogger(typeof(Program).FullName);

        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        private static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)

            .ConfigureServices((context, services) =>
                                {
                                    TaskScheduler.UnobservedTaskException += (s, a) => { log_.Error($"Task unhandled exception: {a.Exception}"); };
                                    AppDomain.CurrentDomain.UnhandledException += (s, a) => log_.Error($"Unhandled exception: {a.ExceptionObject}");
                                })
            .UseNLog()
            .ConfigureWebHostDefaults(webBuilder =>
            {
                webBuilder.UseKestrel((builder, options) =>
                {
                    options.Configure(
                        builder.Configuration.GetSection("Kestrel"), reloadOnChange: true);
                });
                webBuilder.UseStartup<Startup>();
            });
        
    }
}