using Client.WebRequests;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Share.Models;

namespace Client.Pages.Admin.Order
{
    public class IndexModel : PageModel
    {
        private readonly ICustomHttpClient _request;

        public IndexModel(ICustomHttpClient request)
        {
            _request = request;
        }

        [BindProperty]
        public List<Share.Models.Order> Orders { get; set; } = new();
        [BindProperty(SupportsGet =true)]
        public string SearchTerm { get; set; } = string.Empty;

        public async Task<IActionResult> OnGetAsync()
        {
            var response = await _request.GetAsync("https://localhost:5000/api/Order");
            if (response.IsSuccessStatusCode)
            {
                var Order = await response.Content.ReadFromJsonAsync<List<Share.Models.Order>>();
                if (!string.IsNullOrEmpty(SearchTerm))
                {
                    Orders = Order.Where(o =>
                        o.Id.ToString().Contains(SearchTerm, StringComparison.OrdinalIgnoreCase) ||
                        o.ShippingAddress.Contains(SearchTerm, StringComparison.OrdinalIgnoreCase)
                    ).ToList();
                }
                else
                {
                    Orders = Order;
                }
                return Page();
            }
            return Redirect("/Error403");
        }

        public async Task<IActionResult> OnGetDelete(int id)
        {
            var response = await _request.DeleteAsync($"https://localhost:5000/api/Order/{id}");
            if (!response.IsSuccessStatusCode) {
                return Redirect("/Error403");
            }

            return RedirectToPage("/Admin/Order/Index");
        }
    }
}
