import { LightningElement,track,wire } from 'lwc';

export default class Billingconsole_Nuview extends LightningElement {
    @track showStartBtn = true;
    @track timeVal = '24:00:00';
    timeIntervalInstance;
    totalMilliseconds = 86400000;

    start(event) {
        this.showStartBtn = false;
        var parentThis = this;

        // Run timer code in every 100 milliseconds
        this.timeIntervalInstance = setInterval(function() {

            // Time calculations for hours, minutes, seconds and milliseconds
            var hours = Math.floor((parentThis.totalMilliseconds % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((parentThis.totalMilliseconds % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((parentThis.totalMilliseconds % (1000 * 60)) / 1000);
            var milliseconds = Math.floor((parentThis.totalMilliseconds % (1000)));
            
            // Output the result in the timeVal variable
            parentThis.timeVal = hours + ":" + minutes + ":" + seconds ;   
            
            parentThis.totalMilliseconds = parentThis.totalMilliseconds-100;
        }, 100);
    }

    stop(event) {
        this.showStartBtn = true;
        clearInterval(this.timeIntervalInstance);
    }

    reset(event) {
        this.showStartBtn = true;
        this.timeVal = '24:00:00';
        this.totalMilliseconds = 86400000;
        clearInterval(this.timeIntervalInstance);
    }
}