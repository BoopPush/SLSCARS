using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System.Diagnostics;

namespace SlSCarsServerStub.Common
{
    public class LogFilterAsync : IAsyncActionFilter
    {
        private static int requestCount_;
        ILoggerProvider loggerFactory_;

        public LogFilterAsync(ILoggerProvider factory)
        {
            loggerFactory_ = factory;
        }

        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            var controller = ((ControllerBase)context.Controller);
            var requestId = $"{controller.RouteData.Values["action"]}|{Interlocked.Increment(ref requestCount_)}";

            var logger = loggerFactory_.CreateLogger(context.Controller.ToString().Split(".")[^1]);

            var sw = Stopwatch.StartNew();

            logger.LogInformation($"{requestId}({GetArgumentsString(context.ActionArguments)})|Started");
            try
            {
                var response = await next();
                sw.Stop();
                logger.LogInformation($"{requestId}|Completed. Elapsed: {sw.Elapsed}. Response: OK");

            }
            catch (Exception ex)
            {
                sw.Stop();
                logger.LogError(ex, $"{requestId}|Failed. Elapsed: {sw.Elapsed}");

                throw;
            }
        }

        private static string GetArgumentsString(IDictionary<string, object> arguments) =>
            arguments.Any()
                ? string.Join(',', arguments.Select((pair) => $"{pair.Key}={pair.Value}"))
                : string.Empty;
    }
}
