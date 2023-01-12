using System.Collections.Generic;

namespace YieldQuerySystem.Models.ViewModel
{
    public class CloseYieldByLotALLViewModel
    {
        public List<CloseYieldByLotViewModel> LotView { get; set; }
        public List<VMLossData> LossData { get; set; }
        public List<CloseYieldByLotLossDataViewModel> LossDataView { get; set; } = new List<CloseYieldByLotLossDataViewModel>();
    }
}
