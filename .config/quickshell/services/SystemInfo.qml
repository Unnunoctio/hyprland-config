pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick


Item {
    property real cpu_usage: 0
    property real memory_total: 1
    property real memory_free: 1
    property real memory_used: memory_total - memory_free
    property real memory_used_percentage: memory_used / memory_total
    property var previous_cpu_stats: null

    // Leer archivos
    FileView {
        id: fileMeminfo
        path: "/proc/meminfo"
    }

    FileView {
        id: fileStat
        path: "/proc/stat"
    }

    // fotmat KB a GB
    function formatKB(kb) {
        return (kb / (1024 * 1024)).toFixed(1) + " GB"
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        triggeredOnStart: true

        onTriggered: {
            // Recargar Archivos
            fileMeminfo.reload()
            fileStat.reload()

            // Parsear Memory
            const textMeminfo = fileMeminfo.text()
            memory_total = Number(textMeminfo.match(/MemTotal: *(\d+)/)?.[1] ?? 1)
            memory_free = Number(textMeminfo.match(/MemAvailable: *(\d+)/)?.[1] ?? 0)

            // Parsear CPU
            const textStat = fileStat.text()
            const cpuLine = textStat.match(/^cpu\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)/)
            
            if (cpuLine) {
                const stats = cpuLine.slice(1).map(Number)
                const total = stats.reduce((a, b) => a + b, 0)
                const idle = stats[3]
                
                if (previous_cpu_stats) {
                    const totalDiff = total - previous_cpu_stats.total
                    const idleDiff = idle - previous_cpu_stats.idle
                    cpu_usage = totalDiff > 0 ? (1 - idleDiff / totalDiff) : 0
                }
                
                previous_cpu_stats = { total, idle }
            }
        }
    }
}