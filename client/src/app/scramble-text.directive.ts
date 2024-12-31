import { Directive, ElementRef, HostListener, Renderer2 } from '@angular/core';

const DAMPING = 10;
const DELAY = 2;

@Directive({
  standalone: true,
  selector: '[appScrambleText]',
})
export class ScrambleTextDirective {
  private originalText: string = '';
  private isScrambling: boolean = false;
  private textElement: HTMLElement | undefined;

  constructor(
    private el: ElementRef,
    private renderer: Renderer2,
  ) {}

  @HostListener('mouseenter') onMouseEnter() {
    if (!this.isScrambling) {
      this.textElement = this.el.nativeElement.querySelector(
        '.mdc-list-item__primary-text',
      );
      if (this.textElement) {
        this.originalText = this.textElement.innerText;
        this.isScrambling = true;
        this.animate().then();
      }
    }
  }

  @HostListener('mouseleave') onMouseLeave() {
    this.isScrambling = false;
    if (this.textElement) {
      this.renderer.setProperty(
        this.textElement,
        'innerText',
        this.originalText,
      );
    }
  }

  private async animate() {
    const word = this.originalText;
    for (let w of this.shuffle(word)) {
      if (!this.isScrambling) break;
      this.renderer.setProperty(this.textElement, 'innerText', w);
      await this.delay(DELAY);
    }
    this.renderer.setProperty(this.textElement, 'innerText', word);
    this.isScrambling = false;
  }

  private *shuffle(word: string) {
    // const abc = 'abcdefghijklmnopqrstuvwxyz';
    const abc =
      'abcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-=[]{}|;:,.<>?';
    // const abc = 'XO';
    const w = [...word];
    const steps = (w.length + 1) * DAMPING;

    for (let step = 0; step < steps; step++) {
      for (let k = 0; k < w.length; k++) {
        if (step >= steps - w.length * DAMPING + k * DAMPING) {
          w[k] = word[k];
        } else {
          w[k] = abc.charAt(Math.floor(Math.random() * abc.length));
        }
      }
      yield w.join('');
    }
  }

  private delay(n: number) {
    return new Promise((r) => setTimeout(r, n));
  }
}
