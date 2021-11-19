export const fetchBenches = (filters) => {
  console.log(filters)
  return $.ajax({
    url: '/api/benches',
    method: 'GET',
    filters,
    error: (err) => console.log(err)
  })
};