// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import bootstrapPlugin from '@fullcalendar/bootstrap';
import deLocale from '@fullcalendar/core/locales/de';
import itLocale from '@fullcalendar/core/locales/it';
import frLocale from '@fullcalendar/core/locales/fr';

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    locales: [deLocale, itLocale, frLocale],
    plugins: [ dayGridPlugin, timeGridPlugin, listPlugin, bootstrapPlugin],
    themeSystem: 'bootstrap',
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
    },
    weekNumbers: false,
    eventLimit: true, // allow "more" link when too many events
    events: 'https://fullcalendar.io/demo-events.json',
    views: {
            dayGridMonth: {
                columnHeaderFormat: {weekday: 'long'},
                eventTimeFormat: {
                    hour: 'numeric',
                    minute: '2-digit',
                    meridiem: false
                },
                eventLimit: 2
            },
            list: {
                listDayFormat: { weekday: 'long' },
                listDayAltFormat: { day: 'numeric', month: 'long', year: 'numeric'}
            }
        }

  });

  calendar.render();
});
