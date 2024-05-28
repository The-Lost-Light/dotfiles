const date = Variable("", {
  poll: [1000, 'date "+%H:%M:%S %b %e."'],
});

export default () =>
  Widget.Label({
    class_name: "clock",
    label: date.bind(),
  });
