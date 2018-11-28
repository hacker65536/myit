function sysbench.report_json(stat)
   if not gobj then
      io.write('[\n')
      -- hack to print the closing bracket when the Lua state of the reporting
      -- thread is closed
      gobj = newproxy(true)
      getmetatable(gobj).__gc = function () io.write('\n]\n') end
   else
      io.write(',\n')
   end

   local seconds = stat.time_interval
   io.write(([[
  {
    "qp": {
      "reads": %d,
      "writes": %d,
      "other": %d,
      "total": %d
    },
    "trx": %d,
    "err": %d,
    "recon": %d,
    "timetotal": %.4f,
    "tps": %.4f,
    "latency": {
      "min": %4.10f,
      "avg": %4.10f,
      "max": %4.10f,
      "pct": %4.10f,
      "sum": %4.10f
    }
  }
  ]]):format(
        stat.reads,
        stat.writes,
        stat.other,
        stat.reads + stat.writes + stat.other,

        stat.events,
        stat.errors ,
        stat.reconnects,
        stat.time_total,
        stat.events / seconds,

        stat.latency_min,
        stat.latency_avg,
        stat.latency_max,
        stat.latency_pct,
        stat.latency_sum
   ))
end
