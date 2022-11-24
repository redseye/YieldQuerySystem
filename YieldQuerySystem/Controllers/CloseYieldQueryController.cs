using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Data;
using System.Text.Json;
using YieldQuerySystem.Models;
using YieldQuerySystem.Models.DAL;
using YieldQuerySystem.Models.ViewModel;

namespace YieldQuerySystem.Controllers
{
    public class CloseYieldQueryController : Controller
    {
        private readonly IDbConnection _conn;

        public CloseYieldQueryController(IDbConnection conn)
        {
            this._conn = conn;
        }

        public string QueryCloseYieldByLot(QueryDailyYield model)
        {
            List<CloseYieldByLotViewModel> vm = new List<CloseYieldByLotViewModel>();

            DataBaseConnection data = new DataBaseConnection(this._conn);

            vm = data.QueryCloseYieldbyLotData(model);

            return JsonSerializer.Serialize(vm);
        }




    }
}
