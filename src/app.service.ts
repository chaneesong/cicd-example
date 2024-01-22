import { Injectable } from '@nestjs/common';

@Injectable()
export class AppService {
  getHello(): string {
    const consoleTest = process.env.CONSOLE_TEST;
    const test = process.env.ENV_TEST;
    console.log(consoleTest);
    return `${test} CICD!!`;
  }
}
